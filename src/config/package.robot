*** Settings ***
Documentation    Esse será nosso gerenciador de dependências

Library          SeleniumLibrary
Library          DebugLibrary


###########################
#        Keywords         #
###########################
Resource        ../auto/keywords/kws_web.robot


###########################
#         Config          #
###########################
Resource        hooks.robot