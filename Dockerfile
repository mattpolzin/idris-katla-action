FROM mattpolzin2/idris-docker:nightly-katla

# WORKDIR /github/workspace

COPY katla.sh /usr/bin/katla.sh

ENTRYPOINT ["katla.sh"]
