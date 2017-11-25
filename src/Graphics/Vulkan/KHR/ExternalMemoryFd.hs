{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE Strict #-}
module Graphics.Vulkan.KHR.ExternalMemoryFd where

import Graphics.Vulkan.Device( VkDevice(..)
                             )
import Data.Word( Word32
                , Word64
                )
import Foreign.Ptr( Ptr
                  , plusPtr
                  )
import Foreign.Storable( Storable(..)
                       )
import Data.Void( Void
                )
import Graphics.Vulkan.Memory( VkDeviceMemory(..)
                             )
import Graphics.Vulkan.Core( VkStructureType(..)
                           , VkResult(..)
                           )
import Foreign.C.Types( CInt
                      , CInt(..)
                      )
import Graphics.Vulkan.KHR.ExternalMemoryCapabilities( VkExternalMemoryHandleTypeFlagBitsKHR(..)
                                                     )

-- ** vkGetMemoryFdKHR
foreign import ccall "vkGetMemoryFdKHR" vkGetMemoryFdKHR ::
  VkDevice -> Ptr VkMemoryGetFdInfoKHR -> Ptr CInt -> IO VkResult

data VkMemoryFdPropertiesKHR =
  VkMemoryFdPropertiesKHR{ vkSType :: VkStructureType 
                         , vkPNext :: Ptr Void 
                         , vkMemoryTypeBits :: Word32 
                         }
  deriving (Eq, Ord, Show)
instance Storable VkMemoryFdPropertiesKHR where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkMemoryFdPropertiesKHR <$> peek (ptr `plusPtr` 0)
                                     <*> peek (ptr `plusPtr` 8)
                                     <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkMemoryFdPropertiesKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkMemoryFdPropertiesKHR))
                *> poke (ptr `plusPtr` 16) (vkMemoryTypeBits (poked :: VkMemoryFdPropertiesKHR))

data VkMemoryGetFdInfoKHR =
  VkMemoryGetFdInfoKHR{ vkSType :: VkStructureType 
                      , vkPNext :: Ptr Void 
                      , vkMemory :: VkDeviceMemory 
                      , vkHandleType :: VkExternalMemoryHandleTypeFlagBitsKHR 
                      }
  deriving (Eq, Ord, Show)
instance Storable VkMemoryGetFdInfoKHR where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek ptr = VkMemoryGetFdInfoKHR <$> peek (ptr `plusPtr` 0)
                                  <*> peek (ptr `plusPtr` 8)
                                  <*> peek (ptr `plusPtr` 16)
                                  <*> peek (ptr `plusPtr` 24)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkMemoryGetFdInfoKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkMemoryGetFdInfoKHR))
                *> poke (ptr `plusPtr` 16) (vkMemory (poked :: VkMemoryGetFdInfoKHR))
                *> poke (ptr `plusPtr` 24) (vkHandleType (poked :: VkMemoryGetFdInfoKHR))

data VkImportMemoryFdInfoKHR =
  VkImportMemoryFdInfoKHR{ vkSType :: VkStructureType 
                         , vkPNext :: Ptr Void 
                         , vkHandleType :: VkExternalMemoryHandleTypeFlagBitsKHR 
                         , vkFd :: CInt 
                         }
  deriving (Eq, Ord, Show)
instance Storable VkImportMemoryFdInfoKHR where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkImportMemoryFdInfoKHR <$> peek (ptr `plusPtr` 0)
                                     <*> peek (ptr `plusPtr` 8)
                                     <*> peek (ptr `plusPtr` 16)
                                     <*> peek (ptr `plusPtr` 20)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkImportMemoryFdInfoKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkImportMemoryFdInfoKHR))
                *> poke (ptr `plusPtr` 16) (vkHandleType (poked :: VkImportMemoryFdInfoKHR))
                *> poke (ptr `plusPtr` 20) (vkFd (poked :: VkImportMemoryFdInfoKHR))
-- ** vkGetMemoryFdPropertiesKHR
foreign import ccall "vkGetMemoryFdPropertiesKHR" vkGetMemoryFdPropertiesKHR ::
  VkDevice ->
  VkExternalMemoryHandleTypeFlagBitsKHR ->
    CInt -> Ptr VkMemoryFdPropertiesKHR -> IO VkResult