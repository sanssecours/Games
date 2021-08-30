# Generate all documents
all: epub html pdf

# Generate EPUB document
epub:
	Rscript -e "bookdown::render_book('ReadMe.md', 'bookdown::epub_book')"

# Generate (GitBook) HTML document
html:
	Rscript -e "bookdown::render_book('ReadMe.md', 'bookdown::gitbook')"
	Rscript -e "file.rename('Bookdown/Games.html', 'Bookdown/index.html')"

# Generate PDF
pdf:
	Rscript -e "bookdown::render_book('ReadMe.md', 'bookdown::pdf_book')"

# Remove bookdown output
clean:
	Rscript -e "unlink('Bookdown', recursive = TRUE)"
