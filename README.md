# How to Use

Why not make a resume in HTML CSS and Javascript? It's fun, easy and the
most native way for an aspiring web developer. To use this library just
``bundle install`` and then run ``start.sh`` to run guard. Then edit
your slim/less files in public/ and watch guard make .html and .css
ones. Next open each page in a browser with LiveReload like so.

```
open public/resume-page1.html
```

When you are happy with the design print the page and save it into the
pdfs/ folder. FireFox on Mac refuses to remove printer margins so it is
best to use Chrome/Vivaldi Be sure to unset the url and page number in
the browser printing settings. When you are ready output a final pdf using.

```
bundle exec combine_pdfs.rb
```

And add the links using

```
./add_links_to_pdf.pl <Filename>
```

Voila! The final version will be in final.pdf. You can move it to
overwrite the previous pdf. You have a resume made in sweet, sweet
slim and less!

# Resume for Janet Jeffus

The project uses Guard, so I could write the code and rely on
LiveReload to update css and html from the Less and Slim.

There are git submodules I used to get the fonts for transfonter. And I
used npm for managing css dependencies.

I converted it from Word's mishmash of tag soup using Nokogiri. Then
hand-tweaked the less until it looked good. Then printed each page using
Firefox and used combine_pdf to generate the final resume.

[Link to the final
PDF.](https://github.com/jjeffus/resume/raw/master/Janet_Jeffus_resume_2020-11-04.pdf)
