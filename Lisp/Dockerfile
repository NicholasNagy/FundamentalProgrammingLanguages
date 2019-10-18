FROM ubuntu:18.04
RUN apt-get update && \
apt-get install sbcl -y && \
apt-get install curl -y && \
curl -o /tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp && \
sbcl --no-sysinit --no-userinit --load /tmp/ql.lisp \
       --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
       --eval '(ql:add-to-init-file)' \
       --quit
