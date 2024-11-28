(define-non-fungible-token nft-badge uint)
(define-map student-progress
  {student: principal}
  {completed-challenges: uint})
  (define-constant nft-price u10) ;; NFT costs 10 micro-payments
  (define-public (complete-challenge)
  (begin
    (map-insert student-progress
      {student: tx-sender}
      {completed-challenges: (+ (default-to u0 (get completed-challenges (map-get? student-progress {student: tx-sender}))) u1)})
    (ok "Challenge Completed!")
  ))
