-- Pandoc filter that maps the plain markdown of resume.md to the resume layout in _resume/style.tex.
--   front matter     name, email, linkedin, website: page header (date of build added automatically)
--   ## Section       uppercase heading with a rule below
--   ### Entry        bold entry line (role or degree)
--   #### Project     italic project line
--   1. item          numbered as [1], [2], ...
--   [text]{.center}  text placed between the left and right parts of a line
--   [text]{.right}   text pushed to the right margin

local function latex(s)
  return pandoc.RawInline('latex', s)
end

local function wrap(before, inlines, after)
  local out = pandoc.List({ latex(before) })
  out:extend(inlines)
  out:insert(latex(after))
  return out
end

function Span(el)
  if el.classes:includes('right') then
    return wrap('\\rightpart{', el.content, '}')
  elseif el.classes:includes('center') then
    return wrap('\\hfill ', el.content, '\\hfill')
  end
end

local function header(meta)
  local function get(key)
    return meta[key] and pandoc.utils.stringify(meta[key]) or ''
  end
  return pandoc.RawBlock('latex', string.format(
    '\\resumeheader{%s}{%s}{%s}{%s}{%s}',
    get('name'), get('email'), get('linkedin'), get('website'), os.date('%d %b %Y')))
end

function Pandoc(doc)
  local blocks = pandoc.List({ header(doc.meta) })
  for _, b in ipairs(doc.blocks) do
    if b.t == 'Header' and b.level == 2 then
      blocks:insert(pandoc.Plain(wrap('\\resumesection{', b.content, '}')))
    elseif b.t == 'Header' and b.level == 3 then
      blocks:insert(pandoc.RawBlock('latex', '\\resumeentry'))
      blocks:insert(pandoc.Para(wrap('{\\bfseries ', b.content, '}')))
    elseif b.t == 'OrderedList' then
      blocks:insert(pandoc.RawBlock('latex', '\\begin{enumerate}\\renewcommand{\\labelenumi}{[\\arabic{enumi}]}\\tightlist'))
      for _, item in ipairs(b.content) do
        blocks:insert(pandoc.RawBlock('latex', '\\item'))
        blocks:extend(item)
      end
      blocks:insert(pandoc.RawBlock('latex', '\\end{enumerate}'))
    elseif b.t == 'Header' and b.level == 4 then
      blocks:insert(pandoc.RawBlock('latex', '\\resumeproject'))
      blocks:insert(pandoc.Para(wrap('{\\itshape ', b.content, '}')))
    else
      blocks:insert(b)
    end
  end
  doc.blocks = blocks
  return doc
end
