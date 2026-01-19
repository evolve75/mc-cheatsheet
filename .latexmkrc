# XeLaTeX only (fontspec requires it)
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
$pdflatex = $xelatex;

# Generate PDF
$pdf_mode = 1;

# Clean extensions (XeTeX intermediate included)
$clean_ext = 'aux bbl blg brf fls fdb_latexmk idx ilg ind lof lot out synctex.gz toc nav snm vrb xdv';

# Do not auto-preview
$preview_continuous_mode = 0;

# Fail fast
$halt_on_error = 1;

# Record file dependencies (helps reproducibility)
$recorder = 1;
