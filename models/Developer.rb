class Developer
  attr_accessor :id, :name, :founded, :country
  def self.open_connetion
    conn = PG.connect(dbname: 'games')
  end
  def save
    conn = Developer.open_connetion
    if !self.id
      sql = "INSERT INTO developers(name,founded,country) VALUES('#{self.name}','#{self.founded}','#{self.country}')"
    else
      sql = "UPDATE developers SET name='#{self.name}',founded='#{self.founded}',country='#{self.country}'WHERE id=#{self.id}"
    end
    conn.exec(sql)
  end
  def self.all
    conn = self.open_connetion
    sql = "SELECT * FROM developers ORDER BY id"
    results = conn.exec(sql)

    developers = results.map do |developers|
      self.hydrate developers
    end
    developers
  end
  def self.find id
    conn = self.open_connetion
    sql = "SELECT * FROM developers WHERE id=#{id}"
    results = conn.exec(sql)
    developer= self.hydrate results[0]

    developer
  end
  def self.destroy id
    conn = self.open_connetion
    sql = "DELETE FROM developers WHERE id=#{id}"
    conn.exec(sql)
  end
  def self.hydrate developer_data
    developer = Developer.new

    developer.id = developer_data['id']
    developer.name = developer_data['name']
    developer.founded= developer_data['founded']
    developer.country = developer_data['country']

    developer
  end
end
