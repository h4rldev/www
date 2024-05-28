default: 
  just --list
  
@start:
  just install
  cd portfolio-bin
  @docker compose up --build -d

@install:
  mkdir portfolio-dir || true
  chmod +x just_wrapper.sh
  ./just_wrapper.sh portfolio-backend build
  mv portfolio-backend/portfolio-backend ./portfolio-dir/portfolio-bin

  cp -r portfolio-frontend/assets ./portfolio-dir/
  cp -r portfolio-frontend/html ./portfolio-dir/
  cp -r portfolio-frontend/css ./portfolio-dir/
  cp -r *ocker* ./portfolio-dir/


# For git purposes, ignore unless you need to update.
@submod_update:
  git submodule foreach git pull origin master

@submod_update_remote:
  just submod_update
  git add .
  git commit . -m "sync(submodules): Sync submodules to latest commit."
  git push
