# LeetCode Scraper Documentation

## Introduction
Welcome to LeetCode Scraper! 

This Ruby program allows you to scrape and interact with LeetCode problems through a command-line interface (CLI). You can log in, sign up, and list random problems of different difficulty levels.

## Table of Contents
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Usage](#usage)
    - [Logging In or Signing Up](#logging-in-or-signing-up)
    - [Listing Random Problems](#listing-random-problems)
    - [Exiting the Program](#exiting-the-program)
- [Technical Details](#technical-details)
    - [Dependencies](#dependencies)
    - [File Structure](#file-structure)
    - [Authentication](#authentication)
    - [Scraping LeetCode Data](#scraping-leetcode-data)
    - [Problem Class](#problem-class)
    - [User Class](#user-class)

## Getting Started

### Prerequisites
Make sure you have Ruby installed on your machine. You can download it from here.

### Installation
1. Clone the repository to your local machine.
```bash
git clone <repository-url>
```
2. Install the required gems by running:
```bash
bundle install
```

## Usage

### Logging In or Signing Up
1. Run the program using the following command:
```bash
ruby main.rb
```
2. Follow the on-screen instructions to log in or sign up.

### Listing Random Problems
Choose an option from the menu to list 10 random problems of a specific difficulty level.

### Exiting the Program
Type `exit` when prompted for an option to exit the program.

## Technical Details

### Dependencies
- Nokogiri: HTML, XML, SAX, and Reader parser.
- BCrypt: Password hashing.

### File Structure
- lib/cli.rb: Main CLI class handling user interaction.
- lib/scraper.rb: Scraper class responsible for scraping LeetCode data.
- lib/problem.rb: Problem class representing LeetCode problems.
- lib/user.rb: User class managing user authentication.

### Authentication
- Users can log in or sign up with a username and password.
- User credentials are securely stored using BCrypt for password hashing.
- User data is stored in a JSON file (users.json).

### Scraping LeetCode Data
- The program fetches LeetCode problem data from the LeetCode API using Nokogiri.
- Scraped data includes problem title, link, and difficulty level.

### Problem Class
- Represents a LeetCode problem with attributes such as title, link, and difficulty.
- Problems are stored in the @@all_problems class variable.

### User Class
- Manages user data, authentication, and storage.
- User credentials are loaded from and stored in a JSON file (users.json).

## Author
Kayla Marie - Find me on [GitHub](https://github.com/jugglingdev/) and [LinkedIn](https://www.linkedin.com/in/kayla-marie-paden/)

Thank you for using LeetCode Scraper!
