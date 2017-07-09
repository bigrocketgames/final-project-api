Tables

users 
  Stories 
    username, email, & password 
    signup, login, & logout 
  Columns 
    username & email – unique, required 
    password_digest – required 
    first name 
    last name 
    city 
    state 
  Relationships 
    has_many messages 
    has_many favorite teams through user_teams join table
  Class Methods (DB scopes) 
  
  instance Methods

sports 
  Stories 
    sport_names 
  Columns 
    sport_name 
  Relationships 
    has_many teams 
  Class Methods (DB scopes) 
    scope to sort by sport type
  Instance Methods

teams 
  Stories 
  
  Columns 
    team_name 
    mascot 
    sport_id 
  Relationships 
    belongs_to sport 
    has_many fans through user_teams join table 
  Class Methods (DB scopes) 
  
  Instance Methods 
    create schedule

games 
  Stories 
    has two teams and a date 
  Columns 
    game_date 
    game_time 
    home_team_id 
    away_team_id 
  Relationships 
    belongs_to home team 
    belongs_to away team
    has_one chat room
  Class Methods (DB scopes) 
  
  Instance Methods

messages 
  Stories 
    each message has content and the username for who wrote it along with the date 
  Columns 
    content 
    user_id 
    chat_room_id 
  Relationships 
    belongs_to writer 
    belongs_to chat_room 
  Class Methods (DB scopes) 
  
  Instance Methods

chat rooms 
  Stories 
    current chatters 
  Columns

  Relationships 
    has_many chatters 
    has_many messages 
  Class Methods (DB scopes) 
  
  Instance Methods

favorite_teams_join_table
  userID
  teamID