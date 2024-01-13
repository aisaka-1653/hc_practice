def shuffle_group
  group = [*'A'..'F'].shuffle
  ratio = [2, 3].sample
  a = p group[ratio..]
  p group - a
end

shuffle_group