class Game
  attr_accessor :id, :title, :released, :genre, :developer_id
  def self.open_connection
    conn = PG.connect( dbname: 'games')
  end
  def save
    conn = Game.open_connection
    if !self.id
      sql= "INSERT INTO games(title,released,genre,developer_id) VALUES('#{self.title}','#{self.released}','#{self.genre}', '#{self.developer_id}')"
    else
      sql = "UPDATE games SET title='#{self.title}', released='#{self.released}',genre='#{self.genre}',developer_id=#{self.developer_id} WHERE id='#{self.id}'"
    end
    conn.exec(sql)
  end
  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM games ORDER BY id"
    results = conn.exec(sql)
    games = results.map do |game|
      self.hydrate game
    end
    games
  end
  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM games WHERE id=#{id}"
    results = conn.exec(sql)
    game = self.hydrate results[0]

    game
  end
  def self.destroy id
    conn = self.open_connection
    sql = "DELETE FROM games WHERE id=#{id}"
    conn.exec(sql)
  end
  def self.hydrate game_data
    game = Game.new

    game.id = game_data["id"]
    game.title = game_data["title"]
    game.released = game_data["released"]
    game.genre = game_data["genre"]
    game.developer_id = game_data["developer_id"]

    game
  end
end
