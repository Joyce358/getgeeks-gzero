*Settings*
Documentation       Delorean (máquina do tempo de volta ao passado)

Resource            ${EXECDIR}/resources/Database.robot

*Tasks*    #servem para limpar o ambiente pra mim
Back To The Past

    Connect To Postgres
    Reset Env
    Users Seed
    Disconnect From Database


