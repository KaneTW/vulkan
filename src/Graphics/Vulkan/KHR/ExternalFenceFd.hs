{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE Strict #-}
module Graphics.Vulkan.KHR.ExternalFenceFd where

import Graphics.Vulkan.Device( VkDevice(..)
                             )
import Data.Word( Word32
                , Word64
                )
import Foreign.Ptr( Ptr
                  , plusPtr
                  )
import Graphics.Vulkan.KHR.ExternalFenceCapabilities( VkExternalFenceHandleTypeFlagBitsKHR(..)
                                                    )
import Foreign.Storable( Storable(..)
                       )
import Graphics.Vulkan.Fence( VkFence(..)
                            )
import Graphics.Vulkan.KHR.ExternalFence( VkFenceImportFlagsKHR(..)
                                        , VkFenceImportFlagBitsKHR(..)
                                        )
import Data.Void( Void
                )
import Graphics.Vulkan.Core( VkFlags(..)
                           , VkStructureType(..)
                           , VkResult(..)
                           )
import Foreign.C.Types( CInt
                      , CInt(..)
                      )


data VkImportFenceFdInfoKHR =
  VkImportFenceFdInfoKHR{ vkSType :: VkStructureType 
                        , vkPNext :: Ptr Void 
                        , vkFence :: VkFence 
                        , vkFlags :: VkFenceImportFlagsKHR 
                        , vkHandleType :: VkExternalFenceHandleTypeFlagBitsKHR 
                        , vkFd :: CInt 
                        }
  deriving (Eq, Ord, Show)
instance Storable VkImportFenceFdInfoKHR where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek ptr = VkImportFenceFdInfoKHR <$> peek (ptr `plusPtr` 0)
                                    <*> peek (ptr `plusPtr` 8)
                                    <*> peek (ptr `plusPtr` 16)
                                    <*> peek (ptr `plusPtr` 24)
                                    <*> peek (ptr `plusPtr` 28)
                                    <*> peek (ptr `plusPtr` 32)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkImportFenceFdInfoKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkImportFenceFdInfoKHR))
                *> poke (ptr `plusPtr` 16) (vkFence (poked :: VkImportFenceFdInfoKHR))
                *> poke (ptr `plusPtr` 24) (vkFlags (poked :: VkImportFenceFdInfoKHR))
                *> poke (ptr `plusPtr` 28) (vkHandleType (poked :: VkImportFenceFdInfoKHR))
                *> poke (ptr `plusPtr` 32) (vkFd (poked :: VkImportFenceFdInfoKHR))
-- ** vkGetFenceFdKHR
foreign import ccall "vkGetFenceFdKHR" vkGetFenceFdKHR ::
  VkDevice -> Ptr VkFenceGetFdInfoKHR -> Ptr CInt -> IO VkResult

data VkFenceGetFdInfoKHR =
  VkFenceGetFdInfoKHR{ vkSType :: VkStructureType 
                     , vkPNext :: Ptr Void 
                     , vkFence :: VkFence 
                     , vkHandleType :: VkExternalFenceHandleTypeFlagBitsKHR 
                     }
  deriving (Eq, Ord, Show)
instance Storable VkFenceGetFdInfoKHR where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek ptr = VkFenceGetFdInfoKHR <$> peek (ptr `plusPtr` 0)
                                 <*> peek (ptr `plusPtr` 8)
                                 <*> peek (ptr `plusPtr` 16)
                                 <*> peek (ptr `plusPtr` 24)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkFenceGetFdInfoKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkFenceGetFdInfoKHR))
                *> poke (ptr `plusPtr` 16) (vkFence (poked :: VkFenceGetFdInfoKHR))
                *> poke (ptr `plusPtr` 24) (vkHandleType (poked :: VkFenceGetFdInfoKHR))
-- ** vkImportFenceFdKHR
foreign import ccall "vkImportFenceFdKHR" vkImportFenceFdKHR ::
  VkDevice -> Ptr VkImportFenceFdInfoKHR -> IO VkResult