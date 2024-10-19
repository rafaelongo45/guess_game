export FLASK_APP="run.py"
export FLASK_DB_TYPE="sqlite"            # Use SQLITE
export FLASK_DB_PATH="/api//database/database.db" # caminho do banco
flask --app /api/run.py run --host=0.0.0.0 --port=5000