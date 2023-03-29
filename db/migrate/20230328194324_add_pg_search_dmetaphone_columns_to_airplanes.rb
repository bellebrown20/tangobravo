class AddPgSearchDmetaphoneColumnsToAirplanes < ActiveRecord::Migration[6.1]
  def up
    enable_extension 'pg_trgm'
    enable_extension 'fuzzystrmatch'

    add_column :airplanes, :make_dmetaphone, :text
    add_column :airplanes, :engines_dmetaphone, :text
    add_column :airplanes, :tailnumber_dmetaphone, :text
    add_column :airplanes, :home_airport_dmetaphone, :text

    execute <<-SQL
      CREATE INDEX airplanes_make_dmetaphone_idx
      ON airplanes
      USING gin (make_dmetaphone gin_trgm_ops);

      CREATE INDEX airplanes_engines_dmetaphone_idx
      ON airplanes
      USING gin (engines_dmetaphone gin_trgm_ops);

      CREATE INDEX airplanes_tailnumber_dmetaphone_idx
      ON airplanes
      USING gin (tailnumber_dmetaphone gin_trgm_ops);

      CREATE INDEX airplanes_home_airport_dmetaphone_idx
      ON airplanes
      USING gin (home_airport_dmetaphone gin_trgm_ops);
    SQL

    execute <<-SQL
      UPDATE airplanes
      SET make_dmetaphone = dmetaphone(make),
          engines_dmetaphone = dmetaphone(engines),
          tailnumber_dmetaphone = dmetaphone(tailnumber),
          home_airport_dmetaphone = dmetaphone(home_airport);
    SQL
  end

  def down
    remove_column :airplanes, :make_dmetaphone
    remove_column :airplanes, :engines_dmetaphone
    remove_column :airplanes, :tailnumber_dmetaphone
    remove_column :airplanes, :home_airport_dmetaphone
  end
end
