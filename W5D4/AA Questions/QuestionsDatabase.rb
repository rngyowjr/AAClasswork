require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :fname, :lname

  def self.find_by_id(id)
    person = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT 
      * 
    FROM 
      users 
    WHERE
     users.id = ?
    SQL

    # User.new(person.first)
  end

  def self.find_by_name(fname, lname)
    person = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT
     * 
    FROM
      users
    WHERE
     users.fname = ? AND users.lname = ?
    SQL

    # User.new(person.first)
  end

  def authored_questions
    question = QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT
      * 
    FROM
      questions
    WHERE
      user_id = ?
    SQL
  end

  def user_replies
    reply = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        * 
      FROM
        replies
      WHERE
        user_id = ?
      SQL
  end

  def followed_questions
    QuestionFollows.followers_for_question_for_user_id(@id)
  end

  def liked_questions
    QuestionLikes.liked_questions_for_user_id(@id)
  end
    
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
end

class Questions
  attr_accessor :title, :body, :user_id

  def self.find_by_user_id(user_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      * 
    FROM
      questions
    WHERE
      user_id = ?
    SQL
  end
  
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def user
    question = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      * 
    FROM
      users
    WHERE
      id = ?
    SQL
  end

  def replies
    question = QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT
      * 
    FROM
      replies
    WHERE
      question_id = ?
    SQL
  end

  def followers
    QuestionFollows.followers_for_question_id(@id)
  end

  def self.most_followed(n)
    QuestionFollows.most_followed_questions(n)
  end

  def likers
    QuestionLikes.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLikes.num_likes_for_question_id(@id)
  end

  def self.most_liked(n)
    QuestionLikes.most_followed_questions(n)
  end
end

class QuestionFollows
  attr_reader :question_id, :user_id

  def self.followers_for_question_id(question_id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      users.fname, users.lname 
    FROM
      users
    JOIN
      question_follows ON users.id = question_follows.user_id
    JOIN
      questions ON questions.id = question_follows.question_id
    WHERE
      questions.id = ?
    SQL
  end

  def self.followers_for_question_for_user_id(user_id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      questions.title, questions.body
    FROM
      users
    JOIN
      question_follows ON users.id = question_follows.user_id
    JOIN
      questions ON questions.id = question_follows.question_id
    WHERE
      users.id = ?
    SQL
  end

  def self.most_followed_questions(n)
    follow = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      questions.title, COUNT(question_id) AS Count
    FROM
      users
    JOIN
      question_follows ON users.id = question_follows.user_id
    JOIN
      questions ON questions.id = question_follows.question_id
    GROUP BY
      questions.title
    ORDER BY
      Count DESC
    LIMIT 
      ?
    SQL
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end

class Replies
  attr_accessor :question_id, :parent_id, :user_id, :body
  def self.find_by_user_id(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      * 
    FROM
      replies
    WHERE
      user_id = ?
    SQL
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      * 
    FROM
      replies
    WHERE
      question_id = ?
    SQL
  end

  def user
    reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      * 
    FROM
      users
    WHERE
      id = ?
    SQL
  end

  def question
    reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      * 
    FROM
      questions
    WHERE
      id = ?
    SQL
  end

  def parent_reply
    reply = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
    SELECT
      * 
    FROM
      replies
    WHERE
      id = ?
    SQL
  end

  def child_replies
    reply = QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT
      * 
    FROM
      replies
    WHERE
      parent_id = ?
    SQL
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end
end

class QuestionLikes
  def self.likers_for_question_id(question_id)
    like = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      users.fname, users.lname
    FROM
      users
    JOIN
      question_likes ON users.id = question_likes.user_id
    JOIN
      questions ON questions.id = question_likes.question_id
    WHERE
      questions.id = ?
    SQL
  end

  def self.num_likes_for_question_id(question_id)
    like = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      COUNT(users.id)
    FROM
      users
    JOIN
      question_likes ON users.id = question_likes.user_id
    JOIN
      questions ON questions.id = question_likes.question_id
    WHERE
      questions.id = ?
    SQL
  end

  def self.liked_questions_for_user_id(user_id)
    like = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      DISTINCT questions.title
    FROM
      users
    JOIN
      question_likes ON users.id = question_likes.user_id
    JOIN
      questions ON questions.id = question_likes.question_id
    WHERE
      question_likes.question_id IN (
        SELECT
          question_id
        FROM
          question_likes
        WHERE
          user_id = ?
      )
    SQL
  end

  def self.most_liked_questions(n)
    like = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      questions.title, COUNT(question_id) AS Count
    FROM
      users
    JOIN
      question_likes ON users.id = question_likes.user_id
    JOIN
      questions ON questions.id = question_likes.question_id
    GROUP BY
      questions.title
    ORDER BY
      Count DESC
    LIMIT 
      ?
    SQL
  end
end