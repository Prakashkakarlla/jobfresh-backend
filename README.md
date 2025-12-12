# JobFresh - Job Board Application

A full-stack job board application with React.js frontend and Spring Boot backend.

## 🚀 Quick Start

### Prerequisites
- Java 17+
- Maven 3.8+
- MySQL 8.0+

### Local Development

1. **Clone the repository**
```bash
git clone https://github.com/your-username/jobfresh-backend.git
cd jobfresh-backend
```

2. **Configure database**
- Create a MySQL database named `jobboard`
- Update `src/main/resources/application.properties` or set environment variables

3. **Run the application**
```bash
mvn spring-boot:run
```

The API will be available at `http://localhost:8080`

## 📦 Production Deployment (Hostinger VPS)

### 1. Build the JAR
```bash
mvn clean package -DskipTests
```

### 2. Upload to VPS
```bash
scp target/jobboard-0.0.1-SNAPSHOT.jar user@your-vps-ip:/opt/jobfresh/
```

### 3. Create systemd service
Create `/etc/systemd/system/jobfresh.service`:
```ini
[Unit]
Description=JobFresh Backend
After=network.target

[Service]
User=www-data
WorkingDirectory=/opt/jobfresh
ExecStart=/usr/bin/java -jar -Dspring.profiles.active=prod jobboard-0.0.1-SNAPSHOT.jar
SuccessExitStatus=143
TimeoutStopSec=10
Restart=on-failure
RestartSec=5
Environment="DB_URL=jdbc:mysql://localhost:3306/jobboard"
Environment="DB_USERNAME=your_db_user"
Environment="DB_PASSWORD=your_db_password"
Environment="JWT_SECRET=your-secure-jwt-secret"
Environment="CORS_ORIGINS=https://www.jobfresh.in,https://jobfresh.in"
Environment="MAIL_PASSWORD=your_email_password"

[Install]
WantedBy=multi-user.target
```

### 4. Start the service
```bash
sudo systemctl daemon-reload
sudo systemctl enable jobfresh
sudo systemctl start jobfresh
```

### 5. Configure Nginx reverse proxy
```nginx
server {
    listen 80;
    server_name api.jobfresh.in;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

## 🔧 Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `DB_URL` | Database JDBC URL | `jdbc:mysql://localhost:3306/jobboard` |
| `DB_USERNAME` | Database username | `root` |
| `DB_PASSWORD` | Database password | - |
| `JWT_SECRET` | JWT signing secret | - |
| `CORS_ORIGINS` | Allowed CORS origins | `http://localhost:3000` |
| `MAIL_USERNAME` | SMTP username | - |
| `MAIL_PASSWORD` | SMTP password | - |
| `PORT` | Server port | `8080` |

## 📁 Project Structure

```
src/main/java/com/jobboard/
├── config/         # Configuration classes
├── controller/     # REST controllers
├── dto/            # Data transfer objects
├── entity/         # JPA entities
├── exception/      # Custom exceptions
├── repository/     # JPA repositories
├── service/        # Business logic
└── util/           # Utility classes
```

## 🔒 Security

- JWT-based authentication
- Role-based access control (SUPER_ADMIN, ADMIN, JOB_MANAGER, CONTENT_MANAGER, USER)
- Password encryption with BCrypt
- CORS configuration

## 📝 API Endpoints

### Public
- `GET /api/jobs` - List all jobs
- `GET /api/blogs` - List all blogs
- `GET /api/blog-categories` - List blog categories
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration

### Protected
- `POST /api/jobs` - Create job (requires auth)
- `PUT /api/jobs/{id}` - Update job (requires auth)
- `DELETE /api/jobs/{id}` - Delete job (requires auth)

## 📄 License

MIT License
