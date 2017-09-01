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
    sport_names - Football, Soccer, etc.
  Columns 
    sport_name 
  Relationships 
    has_many sub-sports 
  Class Methods (DB scopes) 
    scope to sort by sport type
  Instance Methods

sub-sports
  Stories
    sub-sport names under the sport heading - NFL, NCAAF, NCAA_MBB, Bundesliga, Premier League, etc.
  Columns
    subSport_name
    conference_split - t/f
  Relationships
    belongs_to sport
    has_many teams
  Class Methods (DB scopes)
    
  Instance Methods

teams 
  Stories 
    A team may have a division split and conference name - will use this if in the sub-sport category conference_split is true.
  Columns 
    team_name 
    mascot 
    sport_id 
    conference_and_division_split - t/f
    conference_name
    division_split_name
  Relationships 
    belongs_to sport 
    has_many fans through user_teams join table 
  Class Methods (DB scopes) 
    list games of the team by date.
  Instance Methods

games 
  Stories 
    has two teams and a date 
  Columns 
    game_date - entered in UTC - adjust for time zones?
    home_team_id 
    away_team_id 
  Relationships 
    belongs_to home team 
    belongs_to away team
    has_one chat room
  Class Methods (DB scopes) 
    general list of games by date.
  Instance Methods
    after creation of game - create the chat room for that game.
    

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
    game_id
  Relationships 
    has_many chatters through messages
    has_many messages
    belongs_to game
  Class Methods (DB scopes) 
  
  Instance Methods
    ChatRoomName

favorite_teams_join_table
  userID
  teamID



  ##Routes
    
    ## Users
    POST  /users
    PATCH /users/:id
    PUT   /users/:id
    
    ## Authorization
    POST  /auth
    POST  /auth/refresh

    ## Teams
    POST  /teams
    PATCH /teams/:id
    PUT   /teams/:id

    ## Messages
    POST    /messages
    DELETE  /messages/:id

    ## Sport
    POST  /sports

    ## SubSport
    POST  /subsports

    ## Game
    POST  /games
    PATCH /games/:id
    PUT   /games/:id

    ## Chat Room
    PATCH /chat_rooms/:id
    PUT   /chat_rooms/:id
    