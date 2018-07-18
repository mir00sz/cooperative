#!/usr/bin/env bash
mvn clean install -DskipTests
docker-compose up --build