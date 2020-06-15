# Personal Basic Docker Setup
Which currently allows:
- enable running multiple projects
- https

## Mailhog
- Web App: `https://mail.jamdev.test` 
- SMTP Port: 1025
- Github: https://github.com/mailhog/MailHog

## SSH Container
- SSH DETAILS:
  - ssh_user=jamdev
  - ssh_password=jamdev
  - ssh_port=2222

- Provides ssh container which can be used to access services inside docker network.

- This effectively allows us to do stuff like ssh tunneling to connect to additional services without relying on exposing ports on host (for me a host name is easier to remember than just a random port)

- As an example we can use `project1_database:3306`, `project2_database:3306` instead of `0.0.0.0:3306`, `0.0.0.0:3307` etc...

- This works really well when dealing in the context of microserivces where each service handles it's own set of additional services.

- Many database GUI clients allow connecting via SSH.