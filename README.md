# cowsay - yes, truely bash powered
Passing and parametrizing the unix command cowsay to render as HTML with Flask. Prepared to be hosted with Heroku and deployed using a Dockerfile. 

The app output is in Dutch, of course.

## Requirements
Python, Docker

## API:
Cowsay server hosted on xxx.org answers to a call to ```https://xxx.org/```
with this:

```
 ________________________
< Wij zijn in hilversum. >
 ------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

and to a call with ```https://xxx.org/<name>``` with


```
 ________________________
< <name> is in hilversum. >
 ------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```