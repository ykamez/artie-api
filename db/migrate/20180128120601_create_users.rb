class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      ## Required
      t.string :provider, null: false, default: 'email'
      t.string :uid, null: false, default: ''

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      # TODO: add these columns later, maybe.
      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string   'fullname',       null: false
      t.string :image_data, null: false, default: ''
      t.string :email, null: false
      t.integer 'likes_count', null: false, default: 0
      t.integer 'following_count', null: false, default: 0
      t.integer 'followers_count', null: false, default: 0
      t.decimal 'evaluation_point', null: false, default: 0.0, precision: 3, scale: 1

      ## Tokens
      t.text :tokens

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, [:uid, :provider],     unique: true
    add_index :users, :reset_password_token, unique: true

    # TODO: add these columns later, maybe.
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,       unique: true
  end
end
