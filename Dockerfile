FROM ubuntu:latest

RUN sudo apt update
RUN sudo apt install pip -y

RUN pip install mkdocs