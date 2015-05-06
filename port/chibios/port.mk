ifeq ($(MW_CPPSRC),)
  $(error middleware.mk must be inclused before port.mk)
endif

MW_CPPSRC += $(MW)/port/chibios/src/impl/Middleware_.cpp \
          $(MW)/port/chibios/src/impl/Time_.cpp

ifeq ($(R2P_USE_BOOTLOADER),yes)
MW_CPPSRC += $(MW)/port/chibios/src/impl/Bootloader_.cpp \
          $(MW)/port/chibios/src/impl/Flasher_.cpp
endif

MW_INC += $(MW)/port/chibios/include
