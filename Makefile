setup: requirements.txt
	test -d .git || git init
	test -d ve || virtualenv ve
	ve/bin/pip install -r requirements.txt

upgrade: requirements.txt
	ve/bin/pip install -r requirements.txt -U

syncdeps: requirements.txt
	ve/bin/pip freeze > requirements.txt

hook: hooks
	ls hooks/ | xargs -I {} ln -s hooks/{} .git/hooks/{}
	chmod +x .git/hooks/*

clean:
	find . -name "*.pyc" -exec rm -rf {} \;
