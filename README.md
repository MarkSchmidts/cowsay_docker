# cowsay - yes, truely bash powered
Passing and parametrizing the unix command cowsay to render as HTML with Flask. Prepared to be hosted with Heroku and deployed using a Dockerfile. 

The app output is in Dutch, of course.

## Requirements
Python, Docker, Docker-Compose

## DEV API
Run ```docker-compose up``` to build and start the service locally with python code autoreload.

Run ```docker-compose run cowsay serve``` to start 'production' server.

Run ```docker-compose run cowsay <any command>``` to execute any binary in the container. F.e. execute the bash with ```docker-compose run cowsay /bin/bash```.

## HTTP API
Cowsay server hosted on xxx.org answers to a call to ```https://xxx.org/```
with this:

```
 ________________________
< Wij zijn in Hilversum. >
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
< <name> is in Hilversum. >
 ------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

 