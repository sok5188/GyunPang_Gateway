FROM amazoncorretto:17-al2-jdk AS builder
LABEL authors="sok5188"

RUN mkdir /gateway
WORKDIR /gateway

COPY . .

FROM amazoncorretto:17.0.10-alpine

ENV TZ=Asia/Seoul

RUN mkdir /gateway
WORKDIR /gateway

ARG COLOR
ENV COLOR=${COLOR}

COPY --from=builder /gateway/build/libs/*.jar app.jar

CMD ["java","-Dcolor=${COLOR}", "-jar", "app.jar"]
