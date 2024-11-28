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
(define-public (mint-nft (challenge-id uint))
  (if (is-eq challenge-id u5) ;; Reward NFT after every 5 challenges
  (let ((mint-result (nft-mint? nft-badge challenge-id tx-sender)))
  (if (is-ok mint-result)
    (ok "NFT Awarded!")
    (err "NFT Failed to mint")))
    (err "Complete more challenges to earn an NFT.")))
(define-public (reward-payment)
  (begin
    ;; Replace with real token transfer call in practice
    (ok "Micro-payment rewarded!")))
