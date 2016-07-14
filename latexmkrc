#!/usr/bin/perl

$pdf_mode = 3; # generates pdf via dvipdfmx
$latex = 'uplatex -kanji=utf8 -file-line-error -halt-on-error -interaction=nonstopmode %O %S';
$pdflatex = 'pdflatex -file-line-error -halt-on-error -interaction=nonstopmode %O %S';
$xelatex = 'xelatex -file-line-error -halt-on-error -interaction=nonstopmode %O %S';
$lualatex = 'lualatex -file-line-error -halt-on-error -interaction=nonstopmode %O %S';
$bibtex = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O -o %D %S';

$pvc_view_file_via_temporary = 0; # prevent latexmk from removing PDF after typeset.
