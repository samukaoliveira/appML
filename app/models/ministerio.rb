class Ministerio < ApplicationRecord
    has_and_belongs_to_many :usuarios, join_table: "membros"
end
