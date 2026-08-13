from app import init_db

if __name__ == "__main__":
    try:
        print("Initializing production database schema and initial seed data...")
        init_db()
        print("Database initialized successfully.")
    except Exception as e:
        print(f"Error initializing database: {e}")
