from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    contador = " ".join(str(i) for i in range(1, 11))
    return f"El contador que se ve cuenta del 1 hasta el 10: {contador}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
