FROM node:12-alpine

RUN apk add --update bash

# Setting working directory. 
WORKDIR /usr/src/app

# Installing dependencies
COPY package*.json ./
RUN npm install

# Copying source files
COPY . .

# Give permission to run script
RUN chmod +x ./wait-for-it.sh

# Build files
RUN npm run build

EXPOSE 3000

# App port to run on
ENV PORT=3000

# The domain that this website is on
ENV SITE_NAME="Kutt"

# The domain that this website is on
ENV DEFAULT_DOMAIN="localhost:3000"

# Generated link length
ENV LINK_LENGTH=6

# Postgres database credential details
ENV DB_HOST=localhost
ENV DB_PORT=5432
ENV DB_NAME=postgres
ENV DB_USER=
ENV DB_PASSWORD=
ENV DB_SSL=false

# ONLY NEEDED FOR MIGRATION !!1!
# Neo4j database credential details
ENV NEO4J_DB_URI="bolt://localhost"
ENV NEO4J_DB_USERNAME=neo4j
ENV NEO4J_DB_PASSWORD=BjEphmupAf1D5pDD

# Redis host and port
ENV REDIS_HOST="127.0.0.1"
ENV REDIS_PORT=6379
ENV REDIS_PASSWORD=

# The daily limit for each user
ENV USER_LIMIT_PER_DAY=50

# Create a cooldown for non-logged in users in minutes
# Set 0 to disable
ENV NON_USER_COOLDOWN=0

# Max number of visits for each link to have detailed stats
ENV DEFAULT_MAX_STATS_PER_LINK=5000

# Use HTTPS for links with custom domain
ENV CUSTOM_DOMAIN_USE_HTTPS=false

# A passphrase to encrypt JWT. Use a long and secure key.
ENV JWT_SECRET=securekey

# Admin emails so they can access admin actions on settings page
# Comma seperated
ENV ADMIN_EMAILS=

# Invisible reCaptcha secret key
# Create one in https://www.google.com/recaptcha/intro/
ENV RECAPTCHA_SITE_KEY=
ENV RECAPTCHA_SECRET_KEY=

# Google Cloud API to prevent from users from submitting malware URLs.
# Get it from https://developers.google.com/safe-browsing/v4/get-started
ENV GOOGLE_SAFE_BROWSING_KEY=

# Google Analytics tracking ID for universal analytics.
# Example: UA-XXXX-XX
ENV GOOGLE_ANALYTICS=
ENV GOOGLE_ANALYTICS_UNIVERSAL=

# Google Analytics tracking ID for universal analytics
# This one is used for links
# GOOGLE_ANALYRICS_UNIVERSAL=

# Your email host details to use to send verification emails.
# More info on http://nodemailer.com/
# Mail from example "Kutt <support@kutt.it>". Leave empty to use MAIL_USER
ENV MAIL_HOST=
ENV MAIL_PORT=
ENV MAIL_SECURE=true
ENV MAIL_USER=
ENV MAIL_FROM=
ENV MAIL_PASSWORD=

# The email address that will receive submitted reports.
ENV REPORT_EMAIL=

# Support email to show on the app
ENV CONTACT_EMAIL=

# Running the app
CMD [ "npm", "start" ]