bigrams1 ← {t←{(≢⍵),⍺}⌸2,/' '(≠⊆⊢)⍵ ⋄ t[5↑⍒t;]}
bigrams2 ← {t←{(≢⍵),⍺}⌸2{⍺,' ',⍵}/' '(≠⊆⊢)⍵ ⋄ t[5↑⍒t;]}
bigrams3 ← {x←2,/' '(≠⊆⊢)⍵ ⋄ 5↑{(≢⍵),⊃⍵}¨({1,~2≡/⍵}⊂⊢)x[⍋x]}
