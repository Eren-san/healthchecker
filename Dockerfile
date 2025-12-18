FROM eclipse-temurin:17-jdk-jammy AS builder
WORKDIR /app
COPY . .
RUN javac src/App.java

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=builder /app/src/App.class .
COPY --from=builder /app/src/sites.txt .

CMD ["java", "App"]

