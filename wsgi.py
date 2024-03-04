import os
from app import app
from app.master.views import master_bp

print(os.environ.get("REGION"))
app.register_blueprint(master_bp)

if __name__ == "__main__":
    app.run(debug=True, port=5000)
