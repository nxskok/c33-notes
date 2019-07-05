all: slides_c33.pdf
	evince slides_c33.pdf&
slides_c33.md: slides_c33.Rmd outline_c33.Rmd preliminaries.Rmd rstan.Rmd running_R.Rmd readfile_R.Rmd graphs_R.Rmd numsum_R.Rmd\
inference_R.Rmd reports_R.Rmd tidying_R.Rmd bootstrap.Rmd
	Rscript -e 'knitr::knit("slides_c33.Rmd")'
slides_c33.tex: slides_c33.md 
	/usr/lib/rstudio/bin/pandoc/pandoc +RTS -K512m -RTS slides_c33.md --to beamer --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash\
	       	--output slides_c33.tex --slide-level 2 --variable theme=AnnArbor --variable colortheme=dove --highlight-style tango\
	       	--pdf-engine xelatex --self-contained 
slides_c33.pdf: slides_c33.tex
	xelatex slides_c33.tex
