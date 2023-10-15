# -- Variables -----------------------------------------------------------------

OUTPUT_DIRECTORY := Bookdown
INDEX_FILE := ReadMe.md
OUTPUT_NAME := Games

PDF_FILE := $(OUTPUT_DIRECTORY)/$(OUTPUT_NAME).pdf
EPUB_FILE := $(OUTPUT_DIRECTORY)/$(OUTPUT_NAME).epub
HTML_FILE := $(OUTPUT_DIRECTORY)/$(OUTPUT_NAME).html

# -- Rules ---------------------------------------------------------------------

# Always regenerate output files
.PHONY: clean

default: html
	open "$(OUTPUT_DIRECTORY)/index.html"
	refresh-safari

all: $(EPUB_FILE) $(HTML_FILE) $(PDF_FILE)

epub: $(EPUB_FILE)
html: $(HTML_FILE)
pdf: $(PDF_FILE)

# Generate EPUB document
$(EPUB_FILE):
	Rscript -e "bookdown::render_book('$(INDEX_FILE)', 'bookdown::epub_book')"

# Generate (GitBook) HTML document
$(HTML_FILE):
	Rscript -e "bookdown::render_book('$(INDEX_FILE)', 'bookdown::html_book')"
	Rscript -e "file.rename('$(HTML_FILE)', '$(OUTPUT_DIRECTORY)/index.html')"

# Generate PDF
$(PDF_FILE):
	Rscript -e "bookdown::render_book('$(INDEX_FILE)', 'bookdown::pdf_book')"

clean:
	Rscript -e "unlink('$(OUTPUT_DIRECTORY)', recursive = TRUE)"
