 # NCSA httpd dockerfile

 This is a dockerfile for building the NCSA server from the 90s on modern ubuntu using [Ryan Finnie's fork of NCSA httpd](https://github.com/rfinnie/ncsa-httpd) which works on modern linux.

 This is a server from the 90s. The Apache server before it was the Apache server. It will have a load of bugs/insecurities and shouldn't be used in production. 
 
 I'm on windows so I use git bash with these steps: 
 
 ```
 docker build -t ncsa .
 winpty docker run -dit -p 80:80 ncsa
 winpty docker attach <name of container>
 ```

 Then run this inside the container:

```
 cd ncsa-httpd
 ./httpd 
```