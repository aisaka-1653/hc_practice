# frozen_string_literal: true

golf_score_terms = {
  -4 => 'コンドル',
  -3 => 'アルバトロス',
  -2 => 'イーグル',
  -1 => 'バーディ',
  0 => 'パー',
  1 => 'ボギー'
}

pars, shots = readlines(chomp: true).map { |line| line.split(',').map(&:to_i) }

# 既定打数(par)5で1打(shot)の場合はコンドル
hole_results = pars.zip(shots).map do |par, shot|
  score = shot - par
  next 'ホールインワン' if shot == 1 && par != 5
  next "#{score}ボギー" if score >= 2

  golf_score_terms[score]
end.join(',')

puts hole_results
