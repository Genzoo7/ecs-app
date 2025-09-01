# 1. Wybieramy oficjalny obraz Pythona
FROM python:3.12-slim

# 2. Ustawiamy katalog roboczy w kontenerze
WORKDIR /app

# 3. Kopiujemy plik requirements.txt i instalujemy zależności
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# 4. Kopiujemy plik aplikacji do kontenera
COPY ./app.py /app/app.py

# 5. Eksponujemy port, na którym działa aplikacja
EXPOSE 8080

# 6. Ustawiamy zmienne środowiskowe
ENV FLASK_ENV=development
ENV PORT=8080

# 7. Definiujemy komendę startową
CMD ["python", "app.py"]
