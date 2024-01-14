# frozen_string_literal: true

def shuffle_group
  shuffled_group = [*'A'..'F'].shuffle
  # 3:3か4:2に分ける
  ratio = [3, 4].sample
  sliced_groupes = shuffled_group.each_slice(ratio)
  sliced_groupes.each { |group| p group.sort }
end

shuffle_group
