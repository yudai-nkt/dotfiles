#!/usr/bin/perl

$latex = 'uplatex -synctex=1 -halt-on-error';
$latex_silent = 'platex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex = 'pbibtex';
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 3; # generates pdf via dvipdfmx

# Prevent latexmk from removing PDF after typeset.
$pvc_view_file_via_temporary = 0;
