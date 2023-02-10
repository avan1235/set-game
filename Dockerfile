FROM openjdk:11-jdk-slim AS build
COPY . .
RUN chmod +x ./gradlew
RUN ./gradlew server:shadowJar

FROM openjdk:11-jdk-slim
COPY --from=build ./server/build/libs/server-1.6.0-all.jar ./server-1.6.0-all.jar

ARG POSTGRES_PORT
ARG POSTGRES_DB
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG JDBC_DATABASE_URL
ARG JDBC_DRIVER
ARG HOST
ARG PORT
ARG FORCE_HTTPS
ARG JWT_REALM
ARG JWT_SECRET
ARG JWT_AUDIENCE
ARG JWT_ISSUER
ARG EMAIL_HOST
ARG EMAIL_PORT
ARG EMAIL_USERNAME
ARG EMAIL_PASSWORD
ARG REQUIRE_EMAIL_VERIFY
ARG SCHEME_EMAIL_VERIFY
ARG HOST_EMAIL_VERIFY

ENV POSTGRES_PORT=${POSTGRES_PORT}
ENV POSTGRES_DB=${POSTGRES_DB}
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
ENV JDBC_DATABASE_URL=${JDBC_DATABASE_URL}
ENV JDBC_DRIVER=${JDBC_DRIVER}
ENV HOST=${HOST}
ENV PORT=${PORT}
ENV FORCE_HTTPS=${FORCE_HTTPS}
ENV JWT_REALM=${JWT_REALM}
ENV JWT_SECRET=${JWT_SECRET}
ENV JWT_AUDIENCE=${JWT_AUDIENCE}
ENV JWT_ISSUER=${JWT_ISSUER}
ENV EMAIL_HOST=${EMAIL_HOST}
ENV EMAIL_PORT=${EMAIL_PORT}
ENV EMAIL_USERNAME=${EMAIL_USERNAME}
ENV EMAIL_PASSWORD=${EMAIL_PASSWORD}
ENV REQUIRE_EMAIL_VERIFY=${REQUIRE_EMAIL_VERIFY}
ENV SCHEME_EMAIL_VERIFY=${SCHEME_EMAIL_VERIFY}
ENV HOST_EMAIL_VERIFY=${HOST_EMAIL_VERIFY}
ENV PORT=${PORT}

EXPOSE ${PORT}

ENTRYPOINT ["java","-jar","server-1.6.0-all.jar"]
