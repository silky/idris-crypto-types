-- ---------------------------------------------------------------- [ Sign.idr ]
-- Module      :
-- Description :
-- Copyright   : (c) Jan de Muijnck-Hughes
-- License     : see LICENSE
-- --------------------------------------------------------------------- [ EOH ]
module Crypto.Std.Sign

import Crypto.Common
import Crypto.Message

import Crypto.Std.Key

||| Representation of a digital signature scheme.
class SignScheme s where
  ||| Generate a sign and verify key pair.
  signKeyGen : (Key Public Sign n, Key Private Sign m)

  ||| Sign a message and return a signed message.
  ||| 
  ||| @ sigkey The senders signing key.
  ||| @ msg The message to be signed.
  signMsg : (sigkey : Key Private Sign m)
            -> (msg : Vect a Bits32)
            -> Signed b

  ||| Verify a signed message and return the message.
  ||| 
  ||| @ verkey The senders verification key.
  ||| @ sigmsg The signed message.
  verifyMsg : (verkey : Key Public Sign n)
              -> (sigmsg : Signed b)
              -> Maybe (Vect a Bits32)

-- --------------------------------------------------------------------- [ EOF ]
