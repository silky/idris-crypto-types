-- ----------------------------------------------------------------- [ Key.idr ]
-- Module      : Keys
-- Description : Types Cryptographic Keys MkII
-- Copyright   : (c) Jan de Muijnck-Hughes
-- License     : see LICENSE
-- --------------------------------------------------------------------- [ EOH ]
module Crypto.Adv.Key


--- Question is do I paramiterise over a Key Type...

data Key : ( vis : Visibility) -> (setting : s ) -> Type where
  MkEncKey : (setting : s) -> (value : v ) -> Key Public s
  MkDecKey : (setting : s) -> (value : v ) -> Key Private s
  MkSignKey : (setting : s) -> (value : v ) -> Key Private s
  MkVerifyKey : (setting : s) -> (value : v ) -> Key Public s
