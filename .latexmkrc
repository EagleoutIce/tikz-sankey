# everything latexmk makes goes to build/; only the PDFs are copied back next to the sources
@default_files = ('example.tex', 'tikz-sankey-doc.tex');
$pdf_mode = 1;
$pdf_update_method = 1;
$out_dir = 'build';
$aux_dir = 'build';
$postscript_mode = 0;
$max_repeat = 8; # index, hyperref and code-link need a few rounds from cold
$dvi_mode = 0;
$pdflatex = 'pdflatex %O %S';
# makeindex runs in build/, so it looks for the style of the index here as well
use Cwd;
ensure_path('INDEXSTYLE', getcwd());
$makeindex = "makeindex -s tikz-sankey.ist %O -o %D %S";
ensure_path('TEXINPUTS', './xlistings//');
ensure_path('TEXINPUTS', './build//'); # the manual writes the parts of the package it lists there
ensure_path('TEXINPUTS', './tests/support//');
# -pvc: after every successful run
$success_cmd = 'cp build/%R.pdf .';
# a single run
END {
   foreach my $f (@default_files) {
      (my $pdf = $f) =~ s/\.tex$/.pdf/;
      system('cp', "build/$pdf", '.') if -e "build/$pdf";
   }
}
