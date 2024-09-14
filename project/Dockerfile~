FROM gcc:9.2
COPY . /DockerWorld 
WORKDIR /DockerWorld/
COPY test.txt /DockerWorld
RUN apt-get update
RUN apt-get install -y bison flex
RUN lex nomina.l
RUN yacc -y -d nomina.y
RUN gcc -c nomina.tab.c lex.yy.c
RUN gcc nomina.tab.o lex.yy.o
CMD ["./a.out", "test.txt"]

#Cinthia Portillo


