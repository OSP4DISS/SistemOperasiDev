includeMarkdowns = 000.md

templateFiles = _config.yml .gitignore 000.md 404.html about.md favicon.ico \
				Gemfile index.md links.md Makefile tips.md \
				_includes/disclaimer.html _includes/footer.html _includes/head.html \
				_includes/navbar.html _layouts/default.html assets/main.scss \
				assets/css/uikit-rtl.css assets/css/uikit.css assets/js/uikit-icons.js \
				assets/js/uikit.js assets/scripts/IncludeCode.py

all: $(includeMarkdowns) template.tar.bz2 template.zip

$(includeMarkdowns): %.md: %.pmd
	python3 assets/scripts/IncludeCode.py < $< > $@

template.tar.bz2 template.zip: $(templateFiles)
	tar cjf ./template.tar.bz2 $^
	zip -r ./template.zip $^

serve:
	bundle exec jekyll serve --livereload

clean:
	bundle exec jekyll clean

.PHONY = serve clean

