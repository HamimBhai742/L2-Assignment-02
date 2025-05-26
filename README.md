## What is PostgreSQL?
PostgreSQL একটি শক্তিশালী, ওপেন সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)। এটি ডেটা সংরক্ষণ, ব্যবস্থাপনা এবং অনুসন্ধানের জন্য ব্যবহৃত হয়। এটি SQL (Structured Query Language) ব্যবহার করে কাজ করে, এবং জটিল ডেটা সম্পর্ক সহজভাবে পরিচালনা করতে পারে।

## What is the difference between the VARCHAR and CHAR data types?
CHAR একটি নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং যেখানে ছোট ডেটা হলে বাকি অংশ ফাঁকা (স্পেস) দিয়ে পূরণ করা হয়।
#### উদাহরণ:
CHAR(5) = 'abc' এটি সংরক্ষণ হবে 'abc  ' (দুইটি স্পেসসহ)
VARCHAR পরিবর্তনশীল দৈর্ঘ্যের ডেটা রাখে এবং শুধুমাত্র যতটুকু দরকার ততটুকুই জায়গা নেয়।
#### উদাহরণ:
VARCHAR(5) = 'abc' এটি সংরক্ষণ হবে 'abc'

## Explain the purpose of the WHERE clause in a SELECT statement? 
SELECT স্টেটমেন্টের সাথে WHERE ব্যবহার করে নির্দিষ্ট শর্তে যেসব রেকর্ড মিলে, শুধুমাত্র সেগুলোকেই নির্বাচন করে॥
#### উদাহরণ:
SELECT * FROM students WHERE age = 20;
এখানে শুধু যাদের বয়স ২০, শুধুমাত্র সেগুলোকেই নির্বাচন করবে
##### আরও কিছু শর্ত : >, <,!=,AND,OR,LIKE,ILIKE,IN

## What are the LIMIT and OFFSET clauses used for?
LIMIT ব্যবহার করে আমি নির্দিষ্ট সংখ্যক রের্কড দেখাতে পারব।
#### উদাহরণ:
SELECT * FROM students LIMIT 5;
এই কুয়েরি প্রথম ৫ টা রের্কড দেখাবে।

OFFSET ব্যবহার করে আমি কতটি রের্কড স্কিপ করব তা দেখানো হয়
#### উদাহরণ:
SELECT * FROM students OFFSET 5;
এই কুয়েরি প্রথম ৫ টা রের্কড স্কিপ করবে।

 LIMIT and OFFSET মূলত একসাথে ব্যবহার করা হয় pagination করার জন্য


 ## How can you modify data using UPDATE statements?
UPDATE table_name
SET column_name = value
WHERE condition;

UPDATE কোন টেবিল আপডেট করবে তা বলে
SET	কোন কলামে কী মান বসাবে তা নির্ধারণ করে
WHERE	কোন রেকর্ডগুলো আপডেট হবে তা ঠিক করে

#### উদাহরণ:
UPDATE students
SET age = 23
WHERE name = 'Hamim';

