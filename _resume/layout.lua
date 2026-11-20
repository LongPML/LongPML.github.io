-- Pandoc filter that maps the plain markdown of resume.md to the resume layout in _resume/style.tex.
--   # Name           centered name; the next paragraph (contact line) is centered too
--   ## Section       uppercase heading with a rule below
--   ### Entry        entry line with extra space above
--   [text]{.right}   text pushed to the right margin

local function latex(s)
  return pandoc.RawInline('latex', s)
end

function Span(el)
  if el.classes:includes('right') then
    local out = pandoc.List({ latex('\\rightpart{') })
    out:extend(el.content)
    out:insert(latex('}'))
    return out
  end
end

function Pandoc(doc)
  local blocks = pandoc.List()
  local center_next = false
  for _, b in ipairs(doc.blocks) do
    if b.t == 'Header' and b.level == 1 then
      blocks:insert(pandoc.RawBlock('latex', '\\resumename{' .. pandoc.utils.stringify(b.content) .. '}'))
      center_next = true
    elseif center_next and b.t == 'Para' then
      blocks:insert(pandoc.RawBlock('latex', '{\\centering'))
      blocks:insert(b)
      blocks:insert(pandoc.RawBlock('latex', '\\par}'))
      center_next = false
    elseif b.t == 'Header' and b.level == 2 then
      local inl = pandoc.List({ latex('\\resumesection{') })
      inl:extend(b.content)
      inl:insert(latex('}'))
      blocks:insert(pandoc.Plain(inl))
    elseif b.t == 'Header' and b.level == 3 then
      blocks:insert(pandoc.RawBlock('latex', '\\resumeentry'))
      blocks:insert(pandoc.Para(b.content))
    else
      blocks:insert(b)
    end
  end
  doc.blocks = blocks
  return doc
end
