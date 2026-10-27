# CampusClubs — Ruby on Rails demo

A student club selection application for up to 70 students. Students enter name, class/year, section, email, and select exactly one of seven clubs. The coordinator dashboard shows a registration table, live club totals, search, and CSV export.

## Run locally

Requirements: Ruby compatible with Rails 7.1, Bundler, and SQLite.

```sh
bundle install
bin/rails db:migrate
bin/rails db:seed   # loads 70 clearly fictional demo records for presentation
CLUB_ADMIN_PASSWORD='choose-a-password' bin/rails server
```

Open `http://localhost:3000` for student registration. Open `http://localhost:3000/admin` and sign in with username `admin` and the password set in `CLUB_ADMIN_PASSWORD` to view the dashboard.

To start with an empty database instead of sample records, omit `bin/rails db:seed` (or run `bin/rails db:seed` after confirming you do not need existing registrations; the seed script clears registrations first).

## Notes
- Student email addresses are unique, and a registration cannot be submitted without all fields and one valid club.
- The demo caps the database at 70 registrations.
- Sample data uses fictional names and `example.edu` email addresses. Do not treat it as real student information.
- Configure a strong admin password and HTTPS before hosting publicly. This demo does not verify a student's identity against an official roster.
